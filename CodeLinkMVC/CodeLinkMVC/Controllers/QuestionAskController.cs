using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CodeLinkMVC.Models;

namespace CodeLinkMVC.Controllers
{
    public class QuestionAskController : Controller
    {
        private readonly SurveyContext _context;

        public QuestionAskController(SurveyContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetNextQ()
        {
            //Hardcode in UID
            //int UID = 1;
            var next = 0;
            var check = _context.SurveyAnswer
                            .Where(s => s.Answer != null);
            if (check.Any())
            {

                var answer = _context.SurveyAnswer
                                    // .Where(s => s.UID = UID)
                                    .Join(_context.SurveyQuestion,
                                    c => c.QID,
                                    s => s.Id,
                                    (c, s) => new
                                    {
                                        Answer = c.Answer,
                                        QID = c.QID,
                                        Order = s.Seq
                                    }
                                    )
                                    .Where(s => s.Answer != null)
                                    .OrderByDescending(s => s.Order)
                                    .First();


                next = answer.Order;
                next++;
            }

            var nextQ = _context.SurveyQuestion
                            .Where(s => s.Seq == next)
                            .FirstOrDefault();
            if (nextQ == null)
            {
                return RedirectToAction("Dashboard","Home", new { area = "" });
            }
            var viewModel = new QAnswerViewModel();
            viewModel.Question = nextQ;
            viewModel.Answer = new SurveyAnswerModel();
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Answer( QAnswerViewModel result)
        {
            if (ModelState.IsValid)
            {
                result.Answer.Id = Guid.NewGuid();
                result.Answer.QID = result.Question.Id;

                _context.Add(result.Answer);
                _context.SaveChangesAsync();
                return RedirectToAction(nameof(GetNextQ));
            }
            return Ok();
        }
    }
}
