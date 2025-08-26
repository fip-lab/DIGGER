(define (problem put_CellPhone1_to_Box3_46)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    Book1 - object
    Book2 - object
    Laptop1 - object
    Pencil3 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil2 - object
    Pencil1 - object
    CellPhone1 - object
    CellPhone2 - object
    Pen1 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Box4 - receptacle
    Box2 - receptacle
    Desk2 - receptacle
    Sofa1 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Drawer3 - receptacle
    Box3 - receptacle
    Sofa3 - receptacle
    Drawer2 - receptacle
    Pencil4 - object
    Pencil5 - object
    Pencil6 - object
    KeyChain1 - object
    KeyChain2 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation Book2 Drawer2)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation Laptop1 Desk3)
    (objectAtLocation KeyChain1 Desk3)
    (objectAtLocation KeyChain2 Sofa3)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Pencil2 Box1)
    (objectAtLocation Pencil4 Box2)
    (objectAtLocation Pencil5 Box3)
    (objectAtLocation Pencil6 Box1)
    (objectAtLocation Pencil3 Box3)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Box3)
    )
  )
)
