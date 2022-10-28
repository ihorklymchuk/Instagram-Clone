//
//  ContentView.swift
//  InstagramClone
//
//  Created by Ihor Klymchuk on 28/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                TabBarView()
                StoriesCollection()
                Divider()
                ScrollView(.vertical, showsIndicators: false) {
                    PostHeaderView(image: "ArnoldSchwarzeneggerPicture", accountName: "schwarzenegger", locationName: "Innsbruck, Tirol")
                    PostView(image: "ArnoldSchwarzeneggerPicture")
                    CommentSectionView(likesCount: 897, accountName: "schwarzenegger", comment: "I love animals))")
                    
                    

                    PostHeaderView(image: "JoeBidenPicture", accountName: "potus", locationName: "Washington D.C.")
                    PostView(image: "JoeBidenPicture")
                    CommentSectionView(likesCount: 1765, accountName: "potus", comment: "Fuck russia")


                    PostHeaderView(image: "BorisJohnsonPicture", accountName: "borisjohnsonuk", locationName: "London, UK")
                    PostView(image: "BorisJohnsonPicture")
                    CommentSectionView(likesCount: 4322, accountName: "borisjohnsonuk", comment: "Also fuck russia")
                }
                
                
                VStack(spacing: 0){
                    Divider()
                    
                    HStack{
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                        Spacer()
                            
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                        Spacer()
                        
                        
                        Image(systemName: "play.tv")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                        Spacer()
                        
                        
                        Image(systemName: "bag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                        Spacer()
                        
                        
                        Image("MarcusYoungPicture")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(60)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 2)
                        Spacer()
                    }
                }
                
            }
        }
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
    
    struct TabBarView: View {
        var body: some View {
            HStack {
                
                Image("InstagramLogo")
                    .resizable()
                    .frame(width: 140, height: 52.5)
                
                Spacer()
                
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
            }
        }
    }
}

struct StoryView: View {
    
    var picture: String
    var text: String
    
    
    public init(picture: String, text: String) {
        self.picture = picture
        self.text = text
    }
    
    var body: some View {
        VStack {
            Image(picture)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(60)
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(colors: [.purple, .red, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                        .frame(width: 68, height: 68)
                )
            
            Text(text)
                .foregroundColor(.white)
                .font(Font.headline.weight(.regular))
            
        }
        .frame(width: 80, height: 100)
    }
}



struct StoriesCollection: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack(spacing: 12) {
                StoryView(picture: "MarcusYoungPicture", text: "Your Story")
                StoryView(picture: "JoeBidenPicture", text: "potus")
                StoryView(picture: "BorisJohnsonPicture", text: "borisjohnsonuk")
                StoryView(picture: "CristianoPicture", text: "cristiano")
                StoryView(picture: "ArnoldSchwarzeneggerPicture", text: "schwarzenegger")
            }
            .padding(.horizontal, 8)
            
        }
        
        .padding(.vertical, 12)
    }
}



struct PostHeaderView: View {
    
    var image: String
    var accountName: String
    var locationName: String
    
    public init(image: String, accountName: String, locationName: String) {
        self.image = image
        self.accountName = accountName
        self.locationName = locationName
    }
    
    
    var body: some View {
        HStack {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(60)
                    .overlay(
                        Circle()
                            .stroke(
                                LinearGradient(colors: [.purple, .red, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                            .frame(width: 40, height: 40)
                    )
                    .padding(.horizontal, 12)
            }
            
            HStack {
                VStack {
                    Text(accountName)
                        .foregroundColor(.white)
                        .font(Font.headline.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text(locationName)
                        .foregroundColor(.white)
                        .font(Font.headline.weight(.regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
            }
        }
    }
    
    }




struct PostView: View {
    
    var image: String
    
    public init(image: String) {
        self.image = image
    }
    
    var body: some View {
        VStack {
            
            Image(image)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
            HStack{
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 7)
                    .foregroundColor(.white)
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 7)
                    .foregroundColor(.white)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 7)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 18, height: 25)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 7)
                    .foregroundColor(.white)
                
            }
        }
    }
}





struct CommentSectionView: View {
    
    var likesCount: Int
    var accountName: String
    var comment: String
    
    public init(likesCount: Int, accountName: String, comment: String) {
        self.likesCount = likesCount
        self.accountName = accountName
        self.comment = comment
    }
    
    
    var body: some View {
        VStack{
            Text("\(likesCount) likes")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 7)
                .padding(.vertical, 1)
            
            
            HStack (alignment: .lastTextBaseline){
                Text(accountName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                //.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 1)
                
                Text(comment)
                    .foregroundColor(.white)
                //.frame(maxWidth: .infinity)
                    .padding(.horizontal, 1)
                    .padding(.vertical, 1)
                
                Spacer()
            }
            
            HStack{
                
                Image("MarcusYoungPicture")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .cornerRadius(60)
                    .padding(.horizontal, 7)
                
                Text("Add a comment...")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("❤️ 🙌")
                Image(systemName: "plus.circle")
                    .foregroundColor(.gray)
            }
            
            HStack(){
                Text("3 minutes ago   ·")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 7)
                Text("See translation")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .padding(.horizontal, 1)
                Spacer()
            }
        }
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        
    }
}
