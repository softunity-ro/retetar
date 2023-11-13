using System;
using System.Data;

namespace RetetarWebForms
{
    public partial class Category : System.Web.UI.Page
    {
        public string CategoryName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var res = (DataView)CategoryDS.Select();
            if (res.Table.Rows.Count > 0)
            {
                CategoryName = res?.Table.Rows[0]["Name"].ToString();
            }
            else
            {
                CategoryName = "Aceasta categorie nu exista!";
            }
        }
    }
}