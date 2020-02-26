using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Models.Main
{
    [Table("vSizes",Schema="dbo")]
    public partial class vSize
    {

        public string ProductName { get; set; }


        public string SizeType { get; set; }


        public vSize()
        {
        }
	}
}