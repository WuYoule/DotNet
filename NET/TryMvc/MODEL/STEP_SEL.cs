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
    
    public partial class STEP_SEL
    {
        public int ID { get; set; }
        public int STEP_SEL_ID { get; set; }
        public long STEP_SEQ_ID { get; set; }
        public string STEP_ID { get; set; }
        public string STEP_N { get; set; }
        public string STEP_TYPE { get; set; }
    
        public virtual STEP STEP { get; set; }
    }
}