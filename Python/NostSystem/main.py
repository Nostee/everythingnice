from kivy.app import App
from kivy.uix.floatlayout import FloatLayout
from kivy.graphics import Color, Rectangle

from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput

from kivy.uix.image import Image

from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.popup import Popup

from kivy.metrics import *

import requests

#SETTING UP THINGS#
fSize = sp(16)
subfSize = sp(13)
url = "https://nostsystem-62091.firebaseio.com/.json"
auth_key = "T3kALncgkpHhRlBRgC87lD9ty9SQVwmZhtM0THmw"
offMode = 0
#################

class Login(Screen,FloatLayout): #LoginScreen
    def __init__(self, **kwargs):
        super(Login, self).__init__(**kwargs)
        fl = FloatLayout()

        #BACKGROUND COLOR#
        with self.canvas.before:
            Color(0.25, 0.25, 0.25, 0.25)  # green; colors range from 0-1 instead of 0-255
            self.rect = Rectangle(size=self.size,
                                  pos=self.pos)

        def update_rect(instance, value):
            instance.rect.pos = instance.pos
            instance.rect.size = instance.size

        self.bind(pos=update_rect, size=update_rect)
        #END OF BACKGROUND COLOR#

        #speechbubble
        gif = Image(source="speechwelcome.zip"
                    , anim_delay=0.09
                    , pos_hint={"x": 0.20, "y": 0.54}
                    , size_hint=(0.5, 0.5)
                    )
        fl.add_widget(gif)

        #Logo
        gif = Image(source="welcomeback.zip"
                    ,anim_delay = 0.05
                    ,pos_hint = {"x":0.33,"top":1}
                    ,size_hint = (0.7,0.7)
                    ,allow_stretch = True
                    )
        fl.add_widget(gif)

        #----------------SET-UP WIDGETS----------------#
        lblUser = Label(text = "Username: ",size_hint = (.30,.05), pos_hint = {'x':.05, 'y':.4460}
                        ,font_size = fSize)
        fl.add_widget(lblUser)

        self.txtUser = TextInput(size_hint=(.58, .043), pos_hint={'x': .30, 'y': .45},multiline=False
                                 ,font_size = fSize)
        fl.add_widget(self.txtUser)

        lblPass = Label(text="Password: ", size_hint=(.30, .05), pos_hint={'x': .05, 'y': .3760}
                        ,font_size = fSize)
        fl.add_widget(lblPass)

        self.txtPass = TextInput(size_hint=(.58, .043), pos_hint={'x': .30, 'y': .38},multiline=False
                                 ,font_size = fSize,password = True)
        fl.add_widget(self.txtPass)

        btnSubmit = Button(text="Submit",size_hint = (.33,.05), pos_hint = {'x':.55, 'y':.30},on_press = self.submit
                           ,font_size = fSize)
        fl.add_widget(btnSubmit)

        btnSignUp = Button(text="Sign Up", size_hint=(.33, .05), pos_hint={'x': .55, 'y': .235}
                                , on_press= self.signUp
                                , font_size=fSize)
        fl.add_widget(btnSignUp)

        btnOffline = Button(text="Offline Mode", size_hint=(.33, .05), pos_hint={'x': .55, 'y': .17}
                           , on_press=self.offlineMode
                           , font_size=fSize)
        fl.add_widget(btnOffline)

        lblAuthor = Label(text="Made by Nostee. This project started on 12/19/19."
                          ,font_size = subfSize
                          , size_hint=(.30, .05),
                          pos_hint = {'x':.47, 'y':.04})
        fl.add_widget(lblAuthor)
        # ------------END OF SET-UP WIDGETS------------#

        self.add_widget(fl)

    def submit(self,instance):
        username = self.txtUser.text.strip()
        password = self.txtPass.text.strip()

        users = ""
        data = ""
        truPass = ""
        userFound = False

        try:
            request = requests.get(url + "?auth=" + auth_key)
            data = request.json() #GETS THE KEYS AND VALUES IN DATABASE
            users = data.keys()
        except:
            pass

        if("Username-"+username in users):
            userFound = True
            truPass = data.get("Username-{}".format(username),"").get("Password","") #GETS THE PASSWORD
        else:
            pass

        self.txtPass.text = ""

        if(userFound==True and password==truPass):
            sm.current = "menu"
        else:
            self.popError(0)

    def popError(self,instance):
        popper = FloatLayout()
        popper.add_widget(
            Image(source='error.zip', anim_delay=0.15, size_hint=(1, 1), pos_hint={"x": 0.01, "y": 0.2}))
        popper.add_widget(Label(text='An error..occurred?', size_hint=(1, 0.1)
                                , pos_hint={"x": 0.01, "y": 0.15}
                                ,font_size = fSize))
        popup = Popup(title="", size_hint=(0.6, 0.40)
                      , content=popper)
        popup.separator_height = 0
        popup.open()

    def popSuccess(self,instance):
        popper = FloatLayout()
        popper.add_widget(
            Image(source='success.zip', anim_delay=0.15, size_hint=(1, 1), pos_hint={"x": 0.01, "y": 0.2}))
        popper.add_widget(Label(text='Action executed!', size_hint=(1, 0.1)
                                , pos_hint={"x": 0.01, "y": 0.15}
                                ,font_size = fSize))
        popup = Popup(title="", size_hint=(0.6, 0.40)
                      , content=popper)
        popup.separator_height = 0
        popup.open()

    def offlineMode(self,instance):
        sm.current = "menu"
        offMode = 1

    def signUp(self,instance):
        username = self.txtUser.text.strip()
        password = self.txtPass.text.strip()

        users = ""
        try:
            request = requests.get(url + "?auth=" + auth_key)
            data = request.json()  # GETS THE KEYS AND VALUES IN DATABASE
            users = data.keys()
        except:
            pass

        if ("Username-" + username in users or username=="" or password==""):
            self.popError(0)
        else:
            x = {"Username-{}".format(username): {"Password": password}}
            requests.patch(url=url, json=x)
            print("Success!")
            self.popSuccess(0)

class Menu(Screen,FloatLayout):
    def __init__(self, **kwargs):
        super(Menu, self).__init__(**kwargs)
        fl = FloatLayout()

        # BACKGROUND COLOR #
        with self.canvas.before:
            Color(0.25, 0.25, 0.25, 0.25)  # green; colors range from 0-1 instead of 0-255
            self.rect = Rectangle(size=self.size,
                                  pos=self.pos)

        def update_rect(instance, value):
            instance.rect.pos = instance.pos
            instance.rect.size = instance.size

        self.bind(pos=update_rect, size=update_rect)
        # END OF BACKGROUND COLOR #

        #----------------SET-UP WIDGETS----------------#
        self.btnLogout = Button(text="Logout"
                                ,font_size = fSize
                                ,size_hint = (.30,.05), pos_hint = {'x':.55, 'y':.05},on_press = self.logout)
        fl.add_widget(self.btnLogout)
        # ------------END OF SET-UP WIDGETS------------#

        self.add_widget(fl)

    def _update_rect(self, instance, value):  #BACKGROUND COLOR
        self.rect.pos = instance.pos
        self.rect.size = instance.size

    def logout(self,instance):
        sm.current = "login"
        offMode = 0

sm = ScreenManager()
sm.add_widget(Login(name="login"))
sm.add_widget(Menu(name="menu"))
sm.current = "login"

class Nost_System(App):
    def build(self):
        self.title = "Nostee's System"
        return(sm)

if __name__ == "__main__":
    Nost_System().run()