using System.Web.Mvc;

namespace StoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]       
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult AddToWishlist()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Cart()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult CheckOut()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Men()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Women()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        
        public ActionResult OrderComplete()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult ProductDetail()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
