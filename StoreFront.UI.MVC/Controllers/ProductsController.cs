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


namespace StoreFront.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private PickleBall_StoreEntities db = new PickleBall_StoreEntities(); 

        public ActionResult index(string searchString, int page = 1)
        {
            int pageSize = 10;

            var products = db.Products.OrderBy(m => m.ProductName).ToList();

            if (!String.IsNullOrEmpty(searchString))
            {
                products = (from m in products
                             where m.ProductName.ToLower().Contains(searchString.ToLower())
                             select m).ToList();
            }

            ViewBag.SearchString = searchString;

            return View(products.ToPagedList(page, pageSize));

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
