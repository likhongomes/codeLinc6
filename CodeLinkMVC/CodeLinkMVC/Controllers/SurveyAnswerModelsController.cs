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
    public class SurveyAnswerModelsController : Controller
    {
        private readonly SurveyContext _context;

        public SurveyAnswerModelsController(SurveyContext context)
        {
            _context = context;
        }

        // GET: SurveyAnswerModels
        public async Task<IActionResult> Index()
        {
            return View(await _context.SurveyAnswer.ToListAsync());
        }

        // GET: SurveyAnswerModels/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyAnswerModel = await _context.SurveyAnswer
                .FirstOrDefaultAsync(m => m.Id == id);
            if (surveyAnswerModel == null)
            {
                return NotFound();
            }

            return View(surveyAnswerModel);
        }

        // GET: SurveyAnswerModels/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: SurveyAnswerModels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,UID,QID,Answer")] SurveyAnswerModel surveyAnswerModel)
        {
            if (ModelState.IsValid)
            {
                surveyAnswerModel.Id = Guid.NewGuid();
                _context.Add(surveyAnswerModel);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(surveyAnswerModel);
        }

        // GET: SurveyAnswerModels/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyAnswerModel = await _context.SurveyAnswer.FindAsync(id);
            if (surveyAnswerModel == null)
            {
                return NotFound();
            }
            return View(surveyAnswerModel);
        }

        // POST: SurveyAnswerModels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,UID,QID,Answer")] SurveyAnswerModel surveyAnswerModel)
        {
            if (id != surveyAnswerModel.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(surveyAnswerModel);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SurveyAnswerModelExists(surveyAnswerModel.Id))
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
            return View(surveyAnswerModel);
        }

        // GET: SurveyAnswerModels/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var surveyAnswerModel = await _context.SurveyAnswer
                .FirstOrDefaultAsync(m => m.Id == id);
            if (surveyAnswerModel == null)
            {
                return NotFound();
            }

            return View(surveyAnswerModel);
        }

        // POST: SurveyAnswerModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var surveyAnswerModel = await _context.SurveyAnswer.FindAsync(id);
            _context.SurveyAnswer.Remove(surveyAnswerModel);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SurveyAnswerModelExists(Guid id)
        {
            return _context.SurveyAnswer.Any(e => e.Id == id);
        }
    }
}
