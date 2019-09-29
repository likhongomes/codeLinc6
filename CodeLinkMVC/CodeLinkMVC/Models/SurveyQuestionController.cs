using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace CodeLinkMVC.Models
{
    public class SurveyQuestionController : Controller
    {
        private readonly SurveyContext _context;

        public SurveyQuestionController(SurveyContext context)
        {
            _context = context;
        }

        // GET: SurveyQuestion
        public async Task<IActionResult> Index()
        {
            return View(await _context.SurveyQuestion.ToListAsync());
        }

        // GET: SurveyQuestion/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyQuestionModel = await _context.SurveyQuestion
                .FirstOrDefaultAsync(m => m.Id == id);
            if (surveyQuestionModel == null)
            {
                return NotFound();
            }

            return View(surveyQuestionModel);
        }

        // GET: SurveyQuestion/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: SurveyQuestion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Type,Qtext,Qdesc,Active,Seq,Depends")] SurveyQuestionModel surveyQuestionModel)
        {
            if (ModelState.IsValid)
            {
                surveyQuestionModel.Id = Guid.NewGuid();
                _context.Add(surveyQuestionModel);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(surveyQuestionModel);
        }

        // GET: SurveyQuestion/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyQuestionModel = await _context.SurveyQuestion.FindAsync(id);
            if (surveyQuestionModel == null)
            {
                return NotFound();
            }
            return View(surveyQuestionModel);
        }

        // POST: SurveyQuestion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Type,Qtext,Qdesc,Active,Seq,Depends")] SurveyQuestionModel surveyQuestionModel)
        {
            if (id != surveyQuestionModel.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(surveyQuestionModel);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SurveyQuestionModelExists(surveyQuestionModel.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(surveyQuestionModel);
        }

        // GET: SurveyQuestion/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyQuestionModel = await _context.SurveyQuestion
                .FirstOrDefaultAsync(m => m.Id == id);
            if (surveyQuestionModel == null)
            {
                return NotFound();
            }

            return View(surveyQuestionModel);
        }

        // POST: SurveyQuestion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var surveyQuestionModel = await _context.SurveyQuestion.FindAsync(id);
            _context.SurveyQuestion.Remove(surveyQuestionModel);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SurveyQuestionModelExists(Guid id)
        {
            return _context.SurveyQuestion.Any(e => e.Id == id);
        }
    }
}
