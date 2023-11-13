using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace RetetarWebForms
{
    public static class ControlExtensions
    {
        public static IEnumerable<Control> All(this ControlCollection controls)
        {
            foreach (Control control in controls)
            {
                foreach (var grandChild in control.Controls.All())
                    yield return grandChild;

                yield return control;
            }
        }
    }
}