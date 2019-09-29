using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeLinkMVC.Models
{
    public class SurveyAnswerModel
    {
        public Guid Id { get; set; }
        public Guid UID { get; set; }
        public Guid QID { get; set; }
        public Nullable<bool> Answer { get; set; }
    }
}
