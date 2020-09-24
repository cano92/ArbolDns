"
-NodeDns es una clase nodo (hoja) para construir un arbol con DnsRedes
-cada nodo lleva un nombre (name) y lista de hijos (nodeList) y funciones recursivas para crear el arbol

-aDomainNameCollection  que es una colleccion con los nombres de Dominio
	
-public funciones
	-retorna boolean si el aDomainNameCollection existe 	
		isDomainNameExist:aDomainNameCollection
		
	-agrega un nuevo nombre de Dominio al arbol DnsRedes creando los nodos con (aDomainNameCollection)
		addNodeDns:aDomainNameCollection

-constructor
	NodeDns newNode:aName
"
Class {
	#name : #NodeDns,
	#superclass : #Object,
	#instVars : [
		'nodeList',
		'name'
	],
	#category : #RedesDesafio1
}

{ #category : #'instance creation' }
NodeDns class >> newNode:aName [
	
	^(self new)name:aName.
]

{ #category : #initialization }
NodeDns >> addNewNodeDns:aName [
	"crea un nuevo nodo Dns con el nombre"

	self addNode:(NodeDns newNode:aName).
	
]

{ #category : #initialization }
NodeDns >> addNode:aNodeDns [
		"controlar que no exista el nombre"
	
	self nodeList add:aNodeDns.
]

{ #category : #public }
NodeDns >> addNodeDns:aCollection [
	"agrega un nodo Dns - a Collection debe ser una colleccion de Nombres a Agregar"
		"controla el caso base de la RECURSION, cuando  aCollection no tiene mas elementos"
		aCollection ifNotEmpty: [ self findInsertNodeDns: aCollection ]
]

{ #category : #initialization }
NodeDns >> detectNode:aName [
	"si incluye un nodo con ese nombre entre sus hijos"

	^self nodeList detect: [:nodeDns | (nodeDns name) = aName.]
			ifNone:[ false ]. 

]

{ #category : #initialization }
NodeDns >> findInsertNodeDns:aCollection [
		
			"si ninguno de los nodos hijos tiene el nombre agrega un nuevo nodo con el nombre"	
			(self isIncludeNode:( aCollection last)  )
		
			ifFalse:[ self addNewNodeDns:aCollection last ].

			"recupera el nodo con el ultimo nombre y llama a la recursion eliminando el ultimo elemento"
			self recursionNodeDns:(self detectNode:( aCollection last) )  removeLastCol: aCollection.
	

]

{ #category : #functions }
NodeDns >> findNodeDnsNames: aDomainNameCollection [
	"busca si alguno de sus hijos tiene el ultimo nombre de dominio de aDomainNameCollection "
		"si existe pasa a la recursion sino cortas en falso"
		^( self isIncludeNode:( aDomainNameCollection last ) )
			ifTrue: [ self recursionNodeQueryDns:(self detectNode:(aDomainNameCollection last) ) removeLastCol:aDomainNameCollection ]
			ifFalse:[ false].
	
]

{ #category : #initialization }
NodeDns >> initialize [
	super initialize.
	self nodeList: OrderedCollection new.
]

{ #category : #public }
NodeDns >> isDomainNameExist:aDomainNameCollection [
	"si alguno de sus hijos tiene el nombre se le envia el siguiente nodo"
		
	
		^aDomainNameCollection ifEmpty: [ true ]
			ifNotEmpty:[ self findNodeDnsNames: aDomainNameCollection ].
]

{ #category : #initialization }
NodeDns >> isIncludeNode:aName [
	"si incluye un nodo con ese nombre entre sus hijos"

	^self nodeList anySatisfy: [:nodeDns | (nodeDns name) = aName.]

]

{ #category : #acccessing }
NodeDns >> name [ 

	^name.
]

{ #category : #acccessing }
NodeDns >> name: aName [

	name:=aName.
]

{ #category : #acccessing }
NodeDns >> nodeList [
	
		^nodeList.
		

]

{ #category : #acccessing }
NodeDns >> nodeList:aNodeList [

	nodeList:=aNodeList
]

{ #category : #initialization }
NodeDns >> recursionNodeDns:aNode removeLastCol:aCollection [
		"llama a la RECURSION eliminando el ultimo elemento ya agregado en el arbol"
		
		aCollection removeLast.
		aNode addNodeDns: aCollection.
	
]

{ #category : #functions }
NodeDns >> recursionNodeQueryDns:aNode removeLastCol:aCollection [
		"llama a la RECURSION eliminando el ultimo elemento ya agregado en el arbol"
		
		aCollection removeLast.
		^aNode isDomainNameExist: aCollection.
]
