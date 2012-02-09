using System.Web.Mvc;

namespace $rootnamespace$
{
	public class ErrorController :Controller
	{
		public RedirectToRouteResult Index()
		{
			return RedirectToAction("NotFoundError");
		}

		public ViewResult NotFoundError()
		{
			return View();
		}
	}
}