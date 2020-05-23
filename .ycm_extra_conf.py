import os
def IsCFile( filename ):
    extension = os.path.splitext( filename )[ 1 ]
    return extension in [ '.c' ]

def IsCppFile( filename ):
    extension = os.path.splitext( filename )[ 1 ]
    return extension in [ '.cpp' ]

def Settings( **kwargs ):
    if IsCFile( kwargs[ 'filename' ] ):
        return {
                'flags': [ '-x', 'c', '-std=c11' ],
                }
    if IsCppFile( kwargs[ 'filename' ] ):
        return {
                'flags': [ '-x', 'c++', '-std=c++2a' ],
                }
