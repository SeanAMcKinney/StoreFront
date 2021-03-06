using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using MVC3.UI.MVC.Utilities;
using System.Drawing;
using PagedList;
using PagedList.Mvc;
using StoreFront.UI.MVC.Models;

namespace StoreFront.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private PickleBall_StoreEntities db = new PickleBall_StoreEntities();

        // GET: Products
        public ActionResult Index(string searchFilter)
        {
            var products = db.Products.Include(p => p.ProductCategory).Include(p => p.ProductStatu);
            #region Optional Search filter

            if (String.IsNullOrEmpty(searchFilter))
            {
                var prod = db.Products;
                return View(prod.ToList());
            }
            else
            {

                string searchUpCase = searchFilter.ToUpper();

                List<Product> searchResults = db.Products.Where(
                    a => a.ProductName.ToUpper().Contains(searchUpCase)).ToList();

                return View(searchResults);
            }
            #endregion        
        }

       
        public ActionResult ProductsByCategory(string id)
        {
            var pbc = db.Products.Where(p => p.ProductCategory.ProductCategory1 == id);

            return View(pbc);
        }
       

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        #region Custom-add_to cart funtinality

        public ActionResult AddToCart(int qty, int productID)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Product product = db.Products.Where(p => p.ProductID == productID).FirstOrDefault();

            if (product == null)
            {
                return RedirectToAction("Index");
            }
            else
	        {
                CartItemViewModel item = new CartItemViewModel(qty, product);

                if (shoppingCart.ContainsKey(product.ProductID))
                {
                    shoppingCart[product.ProductID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.ProductID, item);
                }

                Session["cart"] = shoppingCart;
            }

            return RedirectToAction("Index", "ShoppingCart");
        }

        #endregion

        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1");
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "ProductStatusName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,ProductDesc,ProductStatusID,ProductCategoryID")] Product product, HttpPostedFileBase productPic)
        {
            if (ModelState.IsValid)       
            {
                #region File Upload

                string file = "NoImage.png";

                if (productPic != null)
                {
                    file = productPic.FileName;

                    string ext = file.Substring(file.LastIndexOf('.'));

                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".jif" };

                    if (goodExts.Contains(ext.ToLower()) && productPic.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image

                        string savePath = Server.MapPath("~/Content/store_images/");

                        Image convertedImage = Image.FromStream(productPic.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        #endregion
                    }

                    product.ProductImage = file;
                }

                #endregion

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "ProductStatusName", product.ProductStatusID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "ProductStatusName", product.ProductStatusID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,ProductDesc,ProductStatusID,ProductCategoryID")] Product product, HttpPostedFileBase productPic)
        {
            #region File Upload

            string file = "NoImage.png";

            if (productPic != null)
            {
                file = productPic.FileName;

                string ext = file.Substring(file.LastIndexOf('.'));

                string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                if (goodExts.Contains(ext.ToLower()) && productPic.ContentLength <= 4194304)
                {
                    file = Guid.NewGuid() + ext;

                    #region Resize Image

                    string savePath = Server.MapPath("~/Content/store_images/");

                    Image convertedImage = Image.FromStream(productPic.InputStream);

                    int maxImageSize = 500;

                    int maxThumbSize = 100;

                    ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                    #endregion

                    if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                    {
                        string path = Server.MapPath("/Content/store_images/");
                        ImageUtility.Delete(path, product.ProductImage);
                    }

                    product.ProductImage = file;
                }
            }

            #endregion

            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "ProductStatusName", product.ProductStatusID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);

            string path = Server.MapPath("~/Content/store_images/");
            ImageUtility.Delete(path, product.ProductImage);

            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
