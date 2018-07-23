using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;
using ClosedXML.Excel;
using System.IO;
using System.Data;
using WebApplication1.DBAccess;

namespace WebApplication1.Service
{
    public class PatientService
    {
        DatabaseAccess da = new DatabaseAccess();
        public PatientService()
        {
            da.InsertData();
        }

        internal IEnumerable<ClaimModel> GetClaimData()
        {   
            return da.GetClaimData();
        }

        internal IEnumerable<ClinicModel> GetClinicData()
        {
            return da.GetClinicData();
        }

        internal IEnumerable<PatientModel> GetPatientData()
        {
            return da.GetPatientData();
        }
    }
}