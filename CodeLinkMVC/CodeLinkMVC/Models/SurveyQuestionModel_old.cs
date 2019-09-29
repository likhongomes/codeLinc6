using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeLinkMVC.Models
{
    public class SurveyQuestionModel
    {
        public Guid Id{ get; set; }
        public int Type { get; set; }
        public string Qtext { get; set; }

        public string Qdesc { get; set; }

        public Boolean Active { get; set; }

        public int Seq { get; set; }
        public Guid Depends { get; set; }
    }
}


