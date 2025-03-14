# OTT Database  

## Description  
The OTT database is a centralized system for managing user details, content metadata, payments, subscriptions, ratings, subtitles, and awards on a streaming platform. It ensures seamless interactions and efficient content delivery.  

## Entities  

- **Users**: Stores user details (UserID, UserName, Email, EndDate, Password).  
- **Payments**: Records financial transactions (PayID, Amount, PaymentDate).  
- **Subscriptions**: Tracks user subscriptions (SubscribeID, StartDate, EndDate, Type).  
- **Contents**: Manages streaming media (ContentID, ReleaseDate, Type, Genre, Title).  
- **Ratings**: Captures user ratings (RatingID, Rating, Timestamp).  
- **Subtitles**: Stores subtitle options (SubtitleID, NoOfLanguages, English, Tamil, Telugu, Hindi).  
- **Awards**: Tracks content awards (AwardID, AwardYear, AwardName).  

## Relations  

- **HasViewed**: Users to Views (1:n) – Tracks content watched by users.  
- **MadePayment**: Users to Payments (1:n) – Links users to their transactions.  
- **ForContent**: Payments to Contents (m:n) – Shows content purchased by users.  
- **Viewed**: Views to Contents (n:1) – Tracks viewing history per content.  
- **HasSubtitles**: Contents to Subtitles (1:n) – Links subtitles to content.  
- **Rated**: Ratings to Contents (n:1) – Captures user ratings for content.  
- **WonAwards**: Contents to Awards (1:n) – Records awards received by content.  

The database structure ensures efficient data management and enhances user experience on the platform.  
