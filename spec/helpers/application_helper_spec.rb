require "spec_helper"

describe ApplicationHelper, type: :helper do
  it "appends the private frontend url to internal links when constant is set" do
    stub_const("PRIVATE_FRONTEND_INTERNAL_LINKS", true)
    expect(internal_url("/blah")).to eq("http://private-frontend.dev.gov.uk/blah?edition=1")
  end

  it "appends the private frontend url with an edition number to internal links when constant is set" do
    stub_const("PRIVATE_FRONTEND_INTERNAL_LINKS", true)
    expect(internal_url("/blah", 9)).to eq("http://private-frontend.dev.gov.uk/blah?edition=9")
  end

  it "does not append the private frontend url to internal links when constant is not set" do
    stub_const("PRIVATE_FRONTEND_INTERNAL_LINKS", false)
    expect(internal_url("/blah")).to eq("/blah")
  end

  it "generates the html for a step" do
    expect(step(1, "Blah")).to eq("<h2><span class='steps' id='step-1'><span class='visuallyhidden'>Step 1</span></span>Blah</h2>")
  end

  it "generates the html for a step with a description" do
    expect(step(1, "Blah", "(optional)")).to eq("<h2><span class='steps' id='step-1'><span class='visuallyhidden'>Step 1</span></span>Blah <span id='step-1-description'>(optional)</span></h2>")
  end
end
