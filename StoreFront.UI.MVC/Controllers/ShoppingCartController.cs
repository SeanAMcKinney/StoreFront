using StoreFront.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFront.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //User either hasn't put anything in the cart, removed all cart items, or the session expired...
                //Set the cart to an empty cart object (we can still send that to the View, UNLIKE a NULL value.
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                //Create a message informing the user about the empty cart
                ViewBag.Message = "There are no items in your cart.";
            }
            else
            {
                ViewBag.Message = null; //explicitly clear out that ViewBag variable
            }

            return View(shoppingCart);
          
        }

        public ActionResult RemoveFromCart(int id)
        {
            //Get the cart from the session and put it into a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Remove the item 
            shoppingCart.Remove(id);

            //update the session cart
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");

        }

        public ActionResult UpdateCart(int productID, int qty)
        {
            //Get the cart from the Session and stror it in a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Target the correct cart item using the booID for the key. Then change the Qty property with the qty parameter
            shoppingCart[productID].Qty = qty;

            //return the (now updated) local cart to the session
            Session["cart"] = shoppingCart;

            //Send the user to the Shopping Cart Index to see the updated cart
            return RedirectToAction("Index");

        }

    }//end class
}//end namespace