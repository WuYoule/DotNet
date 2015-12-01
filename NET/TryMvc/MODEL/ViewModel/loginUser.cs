using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODEL.ViewModel
{
    public class LoginUser
    {
        [Required(AllowEmptyStrings=false,ErrorMessage="账户名称不能为空！")]
        public string LoginName { get; set; }
        [Required(AllowEmptyStrings=false,ErrorMessage="账户密码不能为空！")]
        public string Pwd { get; set; }
        public bool IsAlways { get; set; }
    }
}
