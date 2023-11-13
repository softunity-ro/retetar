using RetetarWebForms.Constants;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RetetarWebForms
{
    public partial class ImageUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];
                //var filename = Guid.NewGuid().ToString("N") + Path.GetExtension(file.FileName);
                var filepath = Server.MapPath(FilePaths.ImageCategory + file.FileName);
                file.SaveAs(filepath);
                var imageUrl = FilePaths.ImageCategory + file.FileName;
                Response.Write("{ \"imageUrl\": \"" + imageUrl + "\" }");
            }
            else
            {
                Response.Write("{ \"error\": \"Niciun fisier de salvat!\" }");
            }
        }
    }
}