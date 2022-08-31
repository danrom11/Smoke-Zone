using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Microsoft.Extensions.Logging;

using Zona_Dыма_API.Elements;
using System.Net;

using Newtonsoft.Json.Linq;

namespace Zona_Dыма_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ZoneSmokeController : ControllerBase
    {
        [HttpGet("/Zona_Smoke_API/Test")]
        public string Get()
        {
            Product product = new Product(-1, "test", "image", 100, "testDescript", "testBrand", new string[] { "Test1", "Test2" }, 1, 1);

            return JsonSerializer.Serialize<Product>(product, new JsonSerializerOptions { WriteIndented = true });
        }

        [HttpGet("/Zona_Smoke_API/ServerStatus")]
        public string ServerStatus()
        {
            return "OK";
        }

        [HttpGet("/Zona_Smoke_API/Login")]
        public string Login(string mail, string phone)
        {
            return JsonSerializer.Serialize(new Zona_Dыма_API.Elements.UsersCommunication().Login(mail, phone), new JsonSerializerOptions { WriteIndented = true });
        }

        [HttpGet("/Zona_Smoke_API/AddUser")]
        public string AddUser(string userName, string mail, string phone)
        {
            return new Zona_Dыма_API.Elements.UsersCommunication().AddUser(userName, mail, phone);
        }

        [HttpGet("/Zona_Smoke_API/GetInfoUser")]
        public string GetInfoUser(string mail)
        {
            return JsonSerializer.Serialize(new UsersCommunication().InfoUser(mail), new JsonSerializerOptions { WriteIndented = true }); 
        }

        [HttpGet("/Zona_Smoke_API/SendCode")]
        public void SendCode(string mail, string code)
        {
            new Zona_Dыма_API.Elements.UsersCommunication().SendMail(mail, code);
        }


        [HttpGet("/Zona_Smoke_API/GetProducts")]
        public string GetProductsFood(string type)
        {
            return JsonSerializer.Serialize(new ProductsCommunication().GetProducts(type), new JsonSerializerOptions { WriteIndented = true });
        }

        [HttpGet("/Zona_Smoke_API/SetBonus")]
        public string SetBonus(string mail, int bonus)
        {
            return JsonSerializer.Serialize(new UsersCommunication().SetBonus(mail, bonus), new JsonSerializerOptions { WriteIndented = true });
        }

        [HttpGet("/Zona_Smoke_API/SetUserName")]
        public string SetUserName(string mail, string userName)
        {
            return JsonSerializer.Serialize(new UsersCommunication().SetUserName(mail, userName), new JsonSerializerOptions { WriteIndented = true });
        }

        [HttpGet("/Zona_Smoke_API/TestLastFM")]
        public string TestLastFM(string term)
        {

            return JsonSerializer.Serialize(LastFMAPI.MusicCommunication.GetMusic(term));

        }

        [HttpGet("/Zona_Smoke_API/NewTestLastFM")]
        public string NewTestLastFM(string term, int limit)
        {

            return JsonSerializer.Serialize(LastFMAPI.MusicCommunication.GetMusics(term, limit));

        }

        [HttpGet("/Zona_Smoke_API/GetTableBookings")]
        public string GetTableBookings()
        {

            return JsonSerializer.Serialize(new TableBookingCommunication().GetTableBookings());

        }

    }
}
