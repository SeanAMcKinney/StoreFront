//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFront.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductDesc { get; set; }
        public int ProductStatusID { get; set; }
        public int ProductCategoryID { get; set; }
        public string ProductImage { get; set; }
        public Nullable<decimal> ProductPrice { get; set; }
    
        public virtual ProductCategory ProductCategory { get; set; }
        public virtual ProductStatu ProductStatu { get; set; }
    }
}
