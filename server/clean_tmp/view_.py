# * polls view
from bs4 import BeautifulSoup as bfs
import requests
from django.http.response import JsonResponse
from django.shortcuts import render


def getHtml(url):
  headers = {
      'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36'}
  req = requests.get(url, headers=headers)
  if req.status_code == requests.codes.ok:
    print('OK!')
    return bfs(req.text, 'html.parser')
  else:
    print('error')


