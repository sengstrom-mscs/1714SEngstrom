//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714SEngstrom2G
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reciept
    {
        public int Id { get; set; }
        public System.DateTime RecieptDate { get; set; }
        public decimal Amount { get; set; }
    
        public virtual Invoice Invoice { get; set; }
    }
}
