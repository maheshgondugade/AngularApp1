using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Models;
using WebApplication1.Service;

namespace WebApplication1.Controllers
{
  //[Authorize]
    public class PatientController : ApiController
    {
        PatientService _patientService = null;
        public PatientController()
        {
            _patientService = new PatientService();
        }
        
        [HttpGet]
        [Route("api/Patient/GetClaimData")]
        public IEnumerable<ClaimModel> GetClaimData()
        {
            return _patientService.GetClaimData();
        }
        [HttpGet]
        [Route("api/Patient/GetClinicData")]
        public IEnumerable<ClinicModel> GetClinicData()
        {
            return _patientService.GetClinicData();
        }

        [HttpGet]
        [Route("api/Patient/GetPatientData")]
        public IEnumerable<PatientModel> GetPatientData()
        {
            return _patientService.GetPatientData();
        }
    }
}
