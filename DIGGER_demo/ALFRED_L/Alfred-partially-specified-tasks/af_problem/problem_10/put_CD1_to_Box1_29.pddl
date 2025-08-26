(define (problem put_CD1_to_Box1_29)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Laptop2 - object
    Laptop1 - object
    Pillow1 - object
    Pencil1 - object
    CellPhone2 - object
    CD1 - object
    AlarmClock1 - object
    Laptop3 - object
    CreditCard1 - object
    Bed1 - receptacle
    Box2 - receptacle
    Desk3 - receptacle
    Box3 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Bed2 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Book1 - object
    Book2 - object
  )

  (:init
    (atLocation agent1 Bed2)
    (objectAtLocation CellPhone2 Sofa1)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Book2 Sofa1)
    (objectAtLocation Laptop3 Box2)
    (objectAtLocation Laptop2 Box1)
    (objectAtLocation Laptop1 Box1)
  )

  (:goal
    (and
      (objectAtLocation CD1 Box1)
    )
  )
)
