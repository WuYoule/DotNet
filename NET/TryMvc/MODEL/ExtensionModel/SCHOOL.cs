using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODEL
{
    public partial class SCHOOL
    {
        public SCHOOL TOPOCO() {
            SCHOOL poco = new SCHOOL()
            {
                ID = this.ID,
                SCHOOL_ID = this.SCHOOL_ID,
                SCHOOL_NAME = this.SCHOOL_NAME,
                SCHOOL_N = this.SCHOOL_N,
                SCHOOL_TYPE = this.SCHOOL_TYPE,
                SCHOOL_AREA = this.SCHOOL_AREA


            };
            return poco;
        
        
        }
    }
}
