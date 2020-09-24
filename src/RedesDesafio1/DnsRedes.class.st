"
-DnsRedes es un Arbol de Nodos (NodeDns) 
-aDomainString es un string con el format 'ejemplo.algun.dominio'

var
	treeDns  -raiz del arbol
	fileio 	-funciones para lectura filsystem
		
functions
	create:aFileName -recive un dir y nombre de archivo para cargar el arbol Dns
		
	query:aDomainString  -realiza una consulta al arbol Dns para saber si el dominio se encuentra
	
	add:aDomainString 		-agrega al arbol Dns un nuevo Dominio
"
Class {
	#name : #DnsRedes,
	#superclass : #Object,
	#instVars : [
		'treeDns',
		'fileio'
	],
	#category : #RedesDesafio1
}

{ #category : #functions }
DnsRedes >> add:aDomainString [
	"permite agregar un dominio al arbol Dns de dominios. si el dominio existe no agrega nada"
	
	"format aDomain(String):   ejemplo.algun.dominio"
	
	self addNodeDns: (aDomainString splitOn:'.' ).
]

{ #category : #initialization }
DnsRedes >> addNodeDns:aCollection [
	"agrega al arbol Dns un nuevo nodo con aCollection (colleccion con los nombres Dns)"
	
	self treeDns addNodeDns:aCollection.
]

{ #category : #functions }
DnsRedes >> create:aFileName [
	"permite crear un arbol dns a partir de un archivo con nombres Dns"
	
	self fileio readFileDns:aFileName tree:self.
]

{ #category : #initialization }
DnsRedes >> fileio [
	
	^fileio.
]

{ #category : #initialization }
DnsRedes >> fileio:aFileIODnsRedes [
	
	fileio:=aFileIODnsRedes.
]

{ #category : #initialization }
DnsRedes >> initialize [ 
	"crea el arbol y el nodo raiz  '.' root" 
		
		self treeDns: (NodeDns newNode: '.').
		self fileio: (FileIODnsRedes new).
]

{ #category : #functions }
DnsRedes >> query:aDomainString [
	"permite consultar si un dominio existe en el arbol Dns de dominios"
	"ejemplo.algun.dominio"
	^self treeDns isDomainNameExist:( aDomainString splitOn:'.').
	

]

{ #category : #initialization }
DnsRedes >> treeDns [
	
	^treeDns.
]

{ #category : #initialization }
DnsRedes >> treeDns:aTreeDns [
	
	treeDns:=aTreeDns.
]
