// Create me a dotnet hello world controller
using Microsoft.AspNetCore.Mvc;

namespace HelloWorldApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HelloWorldController : ControllerBase
{
	[HttpGet("helloworld")]
	public IActionResult GetHelloWorld()
	{
		return Ok("Hello world!");
	}

	[HttpGet("helloJRKids")]
	public IActionResult GetHelloJRKids()
	{
		return Ok("Hello JRKids!");
	}
}
