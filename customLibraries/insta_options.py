from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class insta_options():

    def __init__(self):

        self.seleLib = BuiltIn().get_library_instance("SeleniumLibrary")


    #method Name Will Be Converted To Keyword Name #Hello World
    @keyword
    def hello_world(self):

        print("hello")

    @keyword
    def select_options_in_home_page(self,options_list[]):
        i=1
        #${available_options} = GetWebElements //div[@class='x6s0dn4 x9f619 xxk0z11 x6ikm8r xeq5yr9 x1s85apg x1swvt13 xzzcqpx']/div
        options = self.seleLib.get_webelements("xpath://div[@class='x6s0dn4 x9f619 xxk0z11 x6ikm8r xeq5yr9 x1s85apg x1swvt13 xzzcqpx']/div")
        for options_title in options:
            if options_title.text in options_list:
                self.seleLib.click_button("(//div[@class='x1n2onr6'])["+str(i)+"]/a")
            i = i + 1



