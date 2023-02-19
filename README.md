# Place-Objects-By-Spline
This Giants Editor script allows you to place objects along the spline that are ready to use as road points for Spline Street Constructor (SSC).
The original author of this script is Ziuta.
I only added the possibility to choose what you want to place along the spline.
# Usage 
# ENG 
Go to AppData/Giants Editor 9.0.3/scripts.
Put the Lua file in there.
Create a spline called "splinePlacement".
Make a path with it where your road will be.
Freeze transformation, scale, and rotation when you're done.
Create a transform in "splinePlacement" called "objectsToPlace" and another transform called "placedObjects".
After that, create a cube or a plane (I haven't tested planes).
You can scale it, for example, like this:
X: 5 meters
Y: 0.2 meters (if you use a cube)
Z: 0.5 meters
Then freeze the scale of this cube/plane and put it in the "objectsToPlace" transform.
Then go to "Scripts" (on the top hotbar) -> "Place Objects Along The Spline" and click it.
After a few seconds, cubes will appear on your map.
Then you simply export the "placedObjects" transform into an i3d file and generate your road using the Spline Street Constructor.
# PL 

Przejdź do AppData/Giants Editor 9.0.3/scripts.
Umieść tam plik Lua.
Utwórz spline o nazwie "splinePlacement".
Ustaw spline tak, jak będzie przebiegać twoja droga.
Wyzeruj translation,scale,rotation, gdy skończysz.
Utwórz transform w "splinePlacement" o nazwie "objectsToPlace" i kolejny transform o nazwie "placedObjects".
Następnie utwórz cube lub plane (nie testowałem plane).
Możesz go przeskalować na przykład tak:
X: 5 [metrów]
Y: 0,2 [metra] (jeśli używasz cuba)
Z: 0,5 [metra]
Następnie wyzeruj skalę tego cuba/plane i umieść go w transformie "objectsToPlace".
Następnie przejdź do "Scripts" (na pasku narzędziowym na górze) -> "Place Objects Along The Spline" i kliknij go.
Po kilku sekundach na twojej mapie pojawią się sześciany.
Następnie wyeksportuj transform "placedObjects" do pliku i3d i wygeneruj swoją drogę za pomocą Spline Street Constructor.



