(define (problem put_CD1_to_Sofa2_80)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    AlarmClock1 - object
    AlarmClock2 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    Pen1 - object
    Pillow2 - object
    Laptop1 - object
    Box1 - receptacle_object
    Box2 - receptacle_object
    CellPhone2 - object
    CD1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Desk6 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CD1 Desk3)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pen1 Desk4)
    (objectAtLocation Laptop1 Desk5)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone2 Bed2)
    (objectAtLocation KeyChain1 Desk6)
    (objectAtLocation AlarmClock1 Box4)
    (objectAtLocation Box4 Box3)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa2)
      (objectAtLocation AlarmClock1 Sofa2)
      (not (objectAtLocation CD1 Box3))
      (not (objectAtLocation CD1 Box4))
      (not (objectAtLocation AlarmClock1 Box3))
      (not (objectAtLocation AlarmClock1 Box4))
    )
  )
)
