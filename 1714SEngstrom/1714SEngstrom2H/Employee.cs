//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714SEngstrom2H
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public int Id { get; set; }
        public string Phone { get; set; }
    
        public virtual Person Person { get; set; }
        public virtual Department Department { get; set; }
        public virtual EmpStatus Employment { get; set; }
    }
}
