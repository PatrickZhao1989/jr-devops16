// Create me a dotnet hello world controller
using Microsoft.AspNetCore.Mvc;

namespace HelloWorldApi.Controllers;

[ApiController]
public class HelloWorldController : ControllerBase
{
	[HttpGet("helloworld")]
	public IActionResult GetHelloWorld()
	{
		return Ok("Hello world!");
	}

	[HttpGet("helloJRKids")]
	public IActionResult GetHelloWorld()
	{
		return Ok("Hello JRKids!");
	}
}
