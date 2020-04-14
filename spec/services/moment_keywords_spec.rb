require 'rails_helper'

FactoryBot.build(:moment,
                 name: "Test ADDICTION",
                 why: "More testing content self-care.",
                 fix: "Text tested is @Teachers!!")


    # moment_name = moment.name
    # moment_why = moment.why
    # moment_fix = moment.fix

# se eu passar extract_moment_keywords nesse moment, eu esperaria um array como este de palavras
# ["test", "addiction", "more", "testing", "content", "self", "care", "text", "tested", "is", "teachers"]

