using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;

namespace StoreFront.DATA.EF//.Metadata
{
    #region DepartmentMetadata  
    public class DepartmentMetadata
    {
        //public int DepartmentID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Department")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less")]
        public string DepartmentName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department { }
    #endregion


    #region EmployeeMetadata
    public class EmployeeMetadata
    {
        //public int EmployeeID { get; set; }

        [Display(Name = "First Name")]
        [Required(ErrorMessage = "* First Name required")]
        [StringLength(20, ErrorMessage = "* Field must be 20 characters or less")]
        public string FirstName { get; set; }

        [StringLength(20, ErrorMessage = "* Field must be 20 characters or less")]
        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "* Last Name required")]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "-N/A-")]
        public Nullable<int> DirectReportID { get; set; }

        [DisplayFormat(NullDisplayText = "-N/A-")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less")]
        public string Title { get; set; }

        [Required(ErrorMessage = "*")]
        public int DepartmentID { get; set; }

    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee
    {
        //Create a custom, read-only property for FullName and update the display attribute 
        [Display(Name = "Employee")]
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }
    }
    

    #endregion

    #region ProductMetadata
    public class ProductMetadata
    {
        //public int ProductID { get; set; }

        [Display(Name = "Product Name")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less")]
        [Required(ErrorMessage = "*")]
        public string ProductName { get; set; }

        [Display(Name = "Product Description")]
        [DisplayFormat(NullDisplayText = "-N/A-")]
        [StringLength(200, ErrorMessage = "* Field must be 200 characters or less")]
        public string ProductDesc { get; set; }

        [Display(Name = "Product StatusID")]
        [Required(ErrorMessage = "*")]
        public int ProductStatusID { get; set; }

        [Display(Name = "Product CategoryID")]
        [Required(ErrorMessage = "*")]
        public int ProductCategoryID { get; set; }

    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product { }
    #endregion

    #region ProductCategoryMetadata
    
    public class ProductCategoryMetadata
    {
        //public int ProductCategoryID { get; set; }

        [Display(Name = "Product Category")]
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less")]
        public string ProductCategory1 { get; set; }
    }

    [MetadataType(typeof(ProductCategoryMetadata))]
    public partial class ProductCategory { }

    #endregion

    #region ProductStatuMetadata
    public class ProductStatuMetadata
    {
        //public int ProductStatusID { get; set; }

        [Display(Name = "Product Status")]
        [Required(ErrorMessage = "*")]
        [StringLength(25, ErrorMessage = "* Field must be 25 characters or less")]
        public string ProductStatusName { get; set; }
    }

    [MetadataType(typeof(ProductStatuMetadata))]
    public partial class ProductStatu { }
    #endregion

}//end namespace
