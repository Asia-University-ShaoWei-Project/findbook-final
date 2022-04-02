from django.http import HttpResponse


def robots(request):
  lines = [
      "User-Agent: *",
      "Disallow: /s/",
      # "Disallow: /junk/",
  ]
  return HttpResponse("\n".join(lines), content_type="text/plain")
