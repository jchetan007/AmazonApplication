using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vMaterials",Schema="dbo")]
    public partial class vMaterial
    {

        public string ProductName { get; set; }


        public string MaterialType { get; set; }


        public vMaterial()
        {
        }
	}
}