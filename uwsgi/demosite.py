import socket
import psycopg2
from yattag import Doc

def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    
    doc, tag, text = Doc().tagtext()
    
    doc.asis('<!DOCTYPE html>')
    with tag('head'):
        with tag('title'):
            text('Chameleon Docker Demo')
        doc.stag('link', rel = 'stylesheet', href = 
        'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css')
    with tag('body'):
        with tag('div', klass = 'container-fluid'):
            with tag('div', klass = 'row'):
                with tag('div', klass = 'col-xs-12 col-md-4 col-md-offset-4'):
                    with tag('h1', klass = 'text-center'):
                        text('Chameleon Cloud Docker Demo')
                    with tag('p', klass = 'text-center'):
                        text('[Demo Explanation Here]')
            with tag('div', klass = 'row'):
                with tag('div', klass = 'col-xs-12 col-md-2 col-md-offset-5'):
                    with tag('div', klass = 'list-group'):
                        conn = psycopg2.connect(host = socket.gethostbyname('postgres'), user = 'docker',
                        password = 'docker', database = 'docker')
                        cur = conn.cursor()
                        
                        cur.execute('select type from cloud_types')
                        for row in cur.fetchall():
                            with tag('div', klass = 'list-group-item'):
                                text(row[0])
                            
                        cur.close()
                        conn.close()
    
    return doc.getvalue()
