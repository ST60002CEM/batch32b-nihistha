import 'package:adoptapet/feature/pets_listing/domain/entity/pets_listing_entity.dart';

class PetsTestData{
  PetsTestData._();

  static List<PetsListingEntity> getPetsTestData() {
    List<PetsListingEntity> lstPets = [
      const PetsListingEntity(
        petid: "667fd12a7fcdb35c36505d73",
        petName: "Buddy",
        petType: "Dog",
        breed: "Unknown",
        gender: "Male",
        size: "Medium",
        aboutPet: "Buddy is a gentle soul who loves long walks in the park and cuddling up on the couch. He was found abandoned but has since blossomed into a loving companion ready to bring joy to a new family.",
        petImage: "1719652650874-dog.jpg",
      ),
      const PetsListingEntity(
          petid: "667fd18c7fcdb35c36505d75",
          petName: "Luna",
          petType: "Dog",
          breed: "Golden Retriever",
          gender: "Female",
          size: "Small",
          aboutPet: "Luna is a playful and energetic husky with striking blue eyes. She adores playing fetch and enjoys the company of other dogs. Luna is looking for an active family who can keep up with her adventurous spirit.",
          petImage: "1719652748851-dog2.jfif"
      ),
    ];
    return lstPets;
  }}
    //
    //   {
    //     "_id": "667fd2937fcdb35c36505d7b",
    //     "petName": "Rocky",
    //     "petType": "Dog",
    //     "breed": "German Shepherd",
    //     "gender": "Male",
    //     "size": "Big",
    //     "aboutPet": "Rocky is a smart and protective shepherd who is fiercely loyal to his family. He's great with obedience training and enjoys outdoor activities. Rocky hopes to find a forever home where he can be a guardian and best friend.",
    //     "petImage": "1719653011035-dog5.jpg",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd2dc7fcdb35c36505d7d",
    //     "petName": "Misty",
    //     "petType": "Dog",
    //     "breed": "Border Collie",
    //     "gender": "Female",
    //     "size": "Small",
    //     "aboutPet": "Misty is an intelligent and agile collie with a knack for learning new tricks. She loves agility courses and thrives on mental stimulation. Misty is searching for an active family who can challenge her mind and provide lots of love.",
    //     "petImage": "1719653084636-dog7.jfif",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd3337fcdb35c36505d7f",
    //     "petName": "Bailey",
    //     "petType": "Dog",
    //     "breed": "Golden Retriever",
    //     "gender": "Female",
    //     "size": "Big",
    //     "aboutPet": "Bailey is a playful and curious retriever with a heart of gold. She loves exploring the outdoors and meeting new people. Bailey is looking for an active family who can give her the love and attention she deserves.",
    //     "petImage": "1719653171461-dog8.jfif",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd5127fcdb35c36505d84",
    //     "petName": "Whiskers",
    //     "petType": "Cat",
    //     "breed": "Unknown",
    //     "gender": "Female",
    //     "size": "Big",
    //     "aboutPet": "Whiskers is a charming tabby cat with a playful personality. He loves chasing feather toys and lounging in sunny spots by the window. Whiskers is looking for a loving family who will shower him with attention and playtime.",
    //     "petImage": "1719653650586-cat1.jpg",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd5477fcdb35c36505d86",
    //     "petName": "Mittens",
    //     "petType": "Cat",
    //     "breed": "Unknown",
    //     "gender": "Female",
    //     "size": "Big",
    //     "aboutPet": "Mittens enjoys being the center of attention and loves cuddling up on laps. Mittens is seeking a quiet home where she can relax and bond closely with her human companions.",
    //     "petImage": "1719653703022-cat2.jpg",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd5687fcdb35c36505d88",
    //     "petName": "Oreo",
    //     "petType": "Cat",
    //     "breed": "Unknown",
    //     "gender": "Male",
    //     "size": "Big",
    //     "aboutPet": "Oreo is a friendly tuxedo cat with a sweet disposition. He enjoys exploring new environments and playing with catnip toys. Oreo is hoping to find a forever family who will provide him with plenty of playtime and affection.",
    //     "petImage": "1719653736045-cat3.jfif",
    //     "__v": 0
    //   },
    //   {
    //     "_id": "667fd5b27fcdb35c36505d8a",
    //     "petName": "Sasha",
    //     "petType": "Cat",
    //     "breed": "Unknown",
    //     "gender": "Female",
    //     "size": "Big",
    //     "aboutPet": "Sasha has a luxurious coat and enjoys grooming sessions and being brushed. Sasha is looking for a calm and loving home where she can be pampered like royalty.\n",
    //     "petImage": "1719653810129-cat4.jpg",
    //     "__v": 0
    //   }
    // ]


