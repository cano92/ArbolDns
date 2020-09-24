"
-FileIODnsRedes es una clases para interactuar con archivos del filesystem
- recibe un nombre aFileName que contenga un formato de nombres de dominio
- y un aTreeDns que es la raiz del arbol de la clase DnsRedes

-para iniciar lectura y carga de los nombres de Dominio de un archivo
-enviar el mensaje a una instancia de DnsRedes

		aDnsRedes readFileDns:aFileName tree:aTreeDns
"
Class {
	#name : #FileIODnsRedes,
	#superclass : #Object,
	#category : #RedesDesafio1
}

{ #category : #'file support' }
FileIODnsRedes >> addTreeDns:aTreeDns domain:lineDnsfile [
		"evita el problema de la ultima line vacia del archivo en la lectura -bugg nodo vacio ''"
		
		( (lineDnsfile size) > 2 )ifTrue: [ aTreeDns add:lineDnsfile ].
		
	
]

{ #category : #'file support' }
FileIODnsRedes >> loadfile:aFileName [
		"devulve una colleccion con las lineas del archivo"

		^(self openFile: aFileName)splitOn:(Character lf).
]

{ #category : #'file support' }
FileIODnsRedes >> openFile:aFileName [
	"devuelve todo el string del archivo"

	^(aFileName asFileReference readStream upToEnd).
]

{ #category : #functions }
FileIODnsRedes >> readFileDns:aFileName tree:aTreeDns [
			"abre el archivo aFileName y carga todos los dominios en aTreeDns "
			
			"lineDnsfile es un string domain Dns - ejemplo.algo.com"
			(self loadfile:aFileName)do: [:lineDnsfile | self addTreeDns:aTreeDns domain:lineDnsfile ].
	
]
