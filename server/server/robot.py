from django.http import HttpResponse


def robots(request):
  lines = [
      "User-Agent: *",
      "Disallow: /s/",
  ]
  return HttpResponse("\n".join(lines), content_type="text/plain")
