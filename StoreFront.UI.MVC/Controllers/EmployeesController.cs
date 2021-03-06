using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class EmployeesController : Controller
    {
        private PickleBall_StoreEntities db = new PickleBall_StoreEntities();

        // GET: Employees
        public ActionResult Index()
        {
            var employees = db.Employees.Include(e => e.Department).Include(e => e.Employee1);
            return View(employees.ToList());
        }

        //// GET: Employees/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Employee employee = db.Employees.Find(id);
        //    if (employee == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(employee);
        //}

        //// GET: Employees/Create
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create()
        //{
        //    ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName");
        //    ViewBag.DirectReportID = new SelectList(db.Employees, "EmployeeID", "FirstName");
        //    return View();
        //}

        //// POST: Employees/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create([Bind(Include = "EmployeeID,FirstName,LastName,DirectReportID,Title,DepartmentID")] Employee employee)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Employees.Add(employee);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", employee.DepartmentID);
        //    ViewBag.DirectReportID = new SelectList(db.Employees, "EmployeeID", "FirstName", employee.DirectReportID);
        //    return View(employee);
        //}

        //// GET: Employees/Edit/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Employee employee = db.Employees.Find(id);
        //    if (employee == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", employee.DepartmentID);
        //    ViewBag.DirectReportID = new SelectList(db.Employees, "EmployeeID", "FirstName", employee.DirectReportID);
        //    return View(employee);
        //}

        //// POST: Employees/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit([Bind(Include = "EmployeeID,FirstName,LastName,DirectReportID,Title,DepartmentID")] Employee employee)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(employee).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.DepartmentID = new SelectList(db.Departments, "DepartmentID", "DepartmentName", employee.DepartmentID);
        //    ViewBag.DirectReportID = new SelectList(db.Employees, "EmployeeID", "FirstName", employee.DirectReportID);
        //    return View(employee);
        //}

        #region original EF delete


        //// GET: Employees/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Employee employee = db.Employees.Find(id);
        //    if (employee == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(employee);
        //}

        //// POST: Employees/Delete/5
        //[Authorize(Roles = "Admin")]
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Employee employee = db.Employees.Find(id);
        //    db.Employees.Remove(employee);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}
        #endregion

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


        //Deletes the publisher record, returns only JSON data on id & the confirmation
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Employee employee = db.Employees.Find(id);
            db.Employees.Remove(employee);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Employee '{0}' from the database.", employee.LastName);
            return Json(new { id = id, message = confirmMessage });
        }

        [HttpGet]
        public PartialViewResult EmployeeDetails(int id)
        {
            Employee employee = db.Employees.Find(id);
            return PartialView(employee);

        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Employee employee)
        {
            db.Employees.Add(employee);
            db.SaveChanges();
            return Json(employee);

         
        }

        
        [HttpGet]
        public PartialViewResult EmployeeEdit(int id)
        {
            Employee employee = db.Employees.Find(id);
            return PartialView(employee);

           
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Employee employee)
        {
            db.Entry(employee).State = EntityState.Modified;
            db.SaveChanges();
            return Json(employee);
        }
    }
}
