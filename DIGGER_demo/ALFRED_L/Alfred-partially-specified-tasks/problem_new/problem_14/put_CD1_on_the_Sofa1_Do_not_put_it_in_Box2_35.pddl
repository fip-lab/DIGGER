(define (problem put_CD1_on_the_Sofa1_Do_not_put_it_in_Box2_35)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pillow1 - object
    CD1 - object
    AlarmClock1 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    CD2 - object
    Pen1 - object
    Laptop1 - object
    CellPhone1 - object
    Sofa1 - receptacle
    Drawer3 - receptacle
    Bed3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    Pencil1 - object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation CD2 Desk1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation KeyChain2 Drawer2)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation Book2 Bed3)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation Watch1 Desk4)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation CD1 Box2))
      (not (objectAtLocation CD1 Box3))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
