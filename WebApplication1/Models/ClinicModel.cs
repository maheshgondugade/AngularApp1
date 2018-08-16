using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static WebApplication1.Enums;

namespace WebApplication1.Models
{
  public class ClinicModel
  {
    public int ClinicID { get; set; }
    public int PatientID { get; set; }

    public string MaritalStatus { get; set; }
    public string Smoking { get; set; }

    public string Alcohol { get; set; }

    public string PrescribedDrugs { get; set; }

    public string Geography { get; set; }

    public string FamilyHistory { get; set; }
    public int TotalReadmission { get; set; }
  }
}
