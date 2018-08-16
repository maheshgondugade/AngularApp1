using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Filters;

using System.Web.Mvc.Filters;

namespace WebApplication1.Controllers
{

  public class CustomAuthenticationAttribute : ActionFilterAttribute, System.Web.Mvc.Filters.IAuthenticationFilter
  {
    public CustomAuthenticationAttribute()
    {

    }
    public void OnAuthentication(AuthenticationContext filterContext)
    {
    }

    public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
    {
    }
  }


  [CustomAuthenticationAttribute]
  public class ValuesController : System.Web.Mvc.Controller
  {

        public ValuesController()
        {

        }
        [ActionName("Test1")]        
        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
