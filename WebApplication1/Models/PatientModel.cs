using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
  public class PatientModel
  {
    public int ClaimID { get; set; }
    public int PatientID { get; set; }
    public int Age { get; set; }
    public string Gender { get; set; }
    public string ServiceCode { get; set; }
    public string Description { get; set; }
    public string RevenueCode { get; set; }
    public string RevenueDescription { get; set; }
    public string DiagosisCode { get; set; }
    public string MaritalStatus { get; set; }
    public string Smoking { get; set; }
    public string Alcohol { get; set; }
    public string PrescribedDrugs { get; set; }
    public string Geography { get; set; }
    public int HCCCode { get; set; }
    public string FamilyHistory { get; set; }
    public int TotalReadmission { get; set; }
  }
}
