//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MODEL
{
    using System;
    using System.Collections.Generic;
    
    public partial class STYLE
    {
        public STYLE()
        {
            this.TASKs = new HashSet<TASK>();
        }
    
        public int ID { get; set; }
        public string STYLE_ID { get; set; }
        public string STYLE_NAME { get; set; }
        public string STYLE_N { get; set; }
        public string STYLE_TYPE { get; set; }
    
        public virtual ICollection<TASK> TASKs { get; set; }
    }
}