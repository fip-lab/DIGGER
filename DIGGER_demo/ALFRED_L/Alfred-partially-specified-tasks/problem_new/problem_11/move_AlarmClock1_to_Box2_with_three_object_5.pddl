(define (problem move_AlarmClock1_to_Box2_with_three_object_5)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone2 - object
    AlarmClock1 - object
    Laptop1 - object
    CellPhone3 - object
    Pencil2 - object
    Pencil1 - object
    CellPhone1 - object
    CD1 - object
    Pen1 - object
    Laptop2 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Drawer4 - receptacle
    Sofa1 - receptacle
    Box1 - receptacle
    Desk1 - receptacle
    Drawer3 - receptacle
    Bed2 - receptacle
    Drawer2 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    KeyChain4 - object
    KeyChain5 - object
    KeyChain6 - object
    Box2 - receptacle
    Box3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation AlarmClock1 Desk1)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation CellPhone1 Bed2)
    (objectAtLocation CD1 Drawer3)
    (objectAtLocation CellPhone2 Drawer4)
    (objectAtLocation CellPhone3 Sofa2)
    (objectAtLocation Pencil2 Drawer2)
    (objectAtLocation KeyChain3 Box2)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation KeyChain5 Box2)
    (objectAtLocation KeyChain6 Box2)
    (objectAtLocation KeyChain2 Box3)
    (objectAtLocation KeyChain4 Box1)
  )

  (:goal
    (and
      (objectAtLocation AlarmClock1 Box2)
    )
  )
)
