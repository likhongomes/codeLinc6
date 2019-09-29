using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeLinkMVC.Models
{
    public class QAnswerViewModel
    {
        public SurveyQuestionModel Question { get; set; }

        public SurveyAnswerModel Answer { get; set; }
    }
}
