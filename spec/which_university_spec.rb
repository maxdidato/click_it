require 'spec_helper'

describe :which_university do

  let(:rake_task) do
    rake = Rake::Application.new
    Rake.application = rake
    Rake::Task.define_task(:environment)
    load("#{ROOT_DIR}/Rakefile")
    rake[subject]
  end

  context 'when no parameters are used' do

    it 'runs ClickIt app with no parameters' do
      expect(ClickIt).to receive(:which_university)
      rake_task.invoke
    end
  end

  context 'when an url is passed' do
    it 'runs ClickIt app with the passed url' do
      expect(ClickIt).to receive(:which_university).with(:custom_url)
      rake_task.invoke(:custom_url)
    end
  end

end