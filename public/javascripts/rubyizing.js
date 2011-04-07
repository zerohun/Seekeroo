function takeOff(tstring)
{
  result = tstring.replace(/[#\{\}]/g, "");
  return result;
}

function dynamicString(tstring)
{

  var pattern = /#\{[^#\{\}]+\}/g;
  var matchs = tstring.match(pattern);
  generated = tstring;
  for (var i in matchs)
  {
      var value = takeOff(String(matchs[i]));
      alert(value);
      var generated = generated.replace(matchs[i], eval(value));
  } 
  return generated;
}

