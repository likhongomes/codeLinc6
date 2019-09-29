using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeLinkMVC.Models
{
    public class SurveyContext :DbContext
    {
        public SurveyContext(DbContextOptions<SurveyContext> options) : base(options) { }
        public DbSet<SurveyQuestionModel> SurveyQuestion { get; set; }
        public DbSet<UserModel> User { get; set; }

        public DbSet<SurveyAnswerModel> SurveyAnswer { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
        }
    }
}

